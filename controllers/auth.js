const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const query = require("../database");

async function registerUser(req, res) {
  const { username, email, nowa, alamat, password } = req.body;

  if (
    username === undefined ||
    username === "" ||
    email === undefined ||
    email === "" ||
    alamat === undefined ||
    alamat === "" ||
    nowa === undefined ||
    isNaN(+nowa) ||
    password === undefined ||
    password === ""
  )
    return res.status(400).json("Data Input Tidak Benar!");

  try {
    const isUsernameDuplicate = await query(
      `
        SELECT id FROM users WHERE username = ?  
    `,
      [username],
    );
    const isEmailDuplicate = await query(
      `
        SELECT id FROM users WHERE email = ?  
    `,
      [email],
    );

    if (isUsernameDuplicate.length > 0)
      return res.status(400).json("Username Sudah Digunakan!");

    if (isEmailDuplicate.length > 0)
      return res.status(400).json("Email Sudah Digunakan!");

    const salt = await bcrypt.genSalt(12);
    const hash = await bcrypt.hash(password, salt);

    await query(
      `INSERT INTO users (username,
      email,
      nowa,
      alamat,
      password) VALUES (
        ?, ?, ?, ?, ?
      )`,
      [username, email, nowa, alamat, hash],
    );

    return res.status(201).json("Register berhasil!");
  } catch (error) {
    return res.status(400).json("Ada Sesuatu Yang salah!");
  }
}

async function loginUser(req, res) {
  const { username, password } = req.body;

  if (
    username === undefined ||
    username === "" ||
    password === undefined ||
    password === ""
  )
    return res.status(400).json("Data Input Tidak Benar!");

  try {
    const user = await query(
      `
        SELECT id, username, password FROM users WHERE username = ? 
      `,
      [username],
    );

    if (user.length === 0)
      return res.status(404).json("Username atau Password Salah!");

    const match = await bcrypt.compare(password, user[0].password);

    if (!match) return res.status(401).json("Password Salah!");

    const token = jwt.sign(
      { userId: user[0].id, username: user[0].username },
      "secret_key",
      { expiresIn: "1d" },
    );
    res.cookie("token", token, {
      // httpOnly: true,
      maxAge: 1 * 60 * 60 * 1000,
    });

    return res.status(200).json({ token });
  } catch (error) {
    return res.status(400).json("Ada Sesuatu Yang salah!");
  }
}

async function verifyUser(req, res, next) {
  const token = req.cookies.token;
  const secretKey = "secret_key"; // Ganti dengan secret key yang sama dengan saat sign token

  if (!token) {
    return res.status(401).json({ message: "Please Provide Token" });
  } else {
    jwt.verify(token, secretKey, (err, decoded) => {
      if (err) {
        return res.status(401).json({ message: "Token tidak valid" });
      }
      req.user = decoded;
      next();
    });
  }
}

// Fungsi untuk mendapatkan data user berdasarkan token yang diverifikasi
async function getUserData(req, res) {
  const username = req.user.username;
  res.json({ username });
}

async function getUser(req, res) {
  const id = req.user.userId;
  const result = await query(
    `SELECT username, email, nowa, alamat FROM users where id=?`,
    [id],
  );
  if (result) {
    res.json({ result });
  } else {
    res.status(404).json("Terjadi kesalahan");
  }
}

async function logout(req, res) {
  res.clearCookie("token");
  return res.json("Logout Successfully");
}

module.exports = {
  registerUser,
  loginUser,
  verifyUser,
  getUserData,
  getUser,
  logout,
};
