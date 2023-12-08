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
    const isDuplicate = await query(
      `
        SELECT id FROM users WHERE username = ? OR email = ? 
    `,
      [username, email],
    );

    if (isDuplicate.length > 0)
      return res.status(400).json("Username atau Email Sudah Digunakan!");

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
      { expiresIn: "1h" },
    );
    res.cookie("token", token);

    return res.status(200).json({ token });
  } catch (error) {
    return res.status(400).json("Ada Sesuatu Yang salah!");
  }
}

module.exports = { registerUser, loginUser };
