const query = require("../database");
const jwt = require("jsonwebtoken");

// get All Vehicle Data

async function getMobilData(req, res) {
  try {
    const id_user = jwt.verify(req.cookies.token, "secret_key").userId;
    const sql = "SELECT * FROM mobil WHERE id_user = ?";
    const data = await query(sql, [id_user]);
    return res.json(data);
  } catch (error) {
    console.log(error);
    return res.status(400).json("Error pada saat mengambil data mobil");
  }
}

async function getMotorData(req, res) {
  try {
    const id_user = jwt.verify(req.cookies.token, "secret_key").userId;
    const sql = "SELECT * FROM motor WHERE id_user = ?";
    const data = await query(sql, [id_user]);
    return res.json(data);
  } catch (error) {
    console.log(error);
    return res.status(400).json("Error pada saat mengambil data motor");
  }
}

// Add Vehicle Data

async function addMobilData(req, res) {
  try {
    const {
      nama_pemilik,
      no_pol,
      nama_kendaraan,
      merek,
      model,
      transmisi,
      tahun,
      warna,
      jenis,
      produk,
    } = req.body;

    const id_user = jwt.verify(req.cookies.token, "secret_key").userId;

    await query(
      `INSERT INTO mobil (id_user, nama_pemilik, no_pol, nama_kendaraan, merek, model, transmisi, tahun, warna, jenis, produk) VALUES (
        ?, ?, ?, ?, ? , ? ,? ,? ,? ,? ,?
      )`,
      [
        id_user,
        nama_pemilik,
        no_pol,
        nama_kendaraan,
        merek,
        model,
        transmisi,
        tahun,
        warna,
        jenis,
        produk,
      ],
    );
    console.log(req.body);

    return res.status(200).json("Data Berhasil ditambahkan");
  } catch (error) {
    console.log(error);
    return res.status(400).json("Error pada saat memasukkan data mobil");
  }
}

async function addMotorData(req, res) {
  try {
    const {
      nama_pemilik,
      no_pol,
      nama_kendaraan,
      merek,
      model,
      transmisi,
      tahun,
      warna,
      jenis,
      produk,
    } = req.body;

    const id_user = jwt.verify(req.cookies.token, "secret_key").userId;

    await query(
      `INSERT INTO motor (id_user, nama_pemilik, no_pol, nama_kendaraan, merek, model, transmisi, tahun, warna, jenis, produk) VALUES (
        ?, ?, ?, ?, ? , ? ,? ,? ,? ,? ,?
      )`,
      [
        id_user,
        nama_pemilik,
        no_pol,
        nama_kendaraan,
        merek,
        model,
        transmisi,
        tahun,
        warna,
        jenis,
        produk,
      ],
    );
    console.log(req.body);

    return res.status(200).json("Data Berhasil ditambahkan");
  } catch (error) {
    console.log(error);
    return res.status(400).json("Error pada saat memasukkan data motor");
  }
}

// get Data By Id

async function getMobilDataById(req, res) {
  const sql = "SELECT * FROM mobil WHERE ID = ?";
  const id = req.params.id;

  const data = await query(sql, [id]);
  if (!data) return res.json({ msg: "Error Inside Server" });
  return res.json(data);
}

async function getMotorDataById(req, res) {
  const sql = "SELECT * FROM motor WHERE ID = ?";
  const id = req.params.id;

  const data = await query(sql, [id]);
  if (!data) return res.json({ msg: "Error Inside Server" });
  return res.json(data);
}

// delete data vehicle

async function deleteMobilById(req, res) {
  try {
    const sql = "DELETE FROM mobil WHERE ID = ?";
    const id = req.params.id;

    await query(sql, [id]);

    return res.status(200).json("Mobil berhasil dihapus");
  } catch (error) {
    console.error(error);
    return res.status(500).json({ msg: "Internal Server Error" });
  }
}

async function deleteMotorById(req, res) {
  try {
    const sql = "DELETE FROM motor WHERE ID = ?";
    const id = req.params.id;

    await query(sql, [id]);

    return res.status(200).json("Motor berhasil dihapus");
  } catch (error) {
    console.error(error);
    return res.status(500).json({ msg: "Internal Server Error" });
  }
}

// get total data vehicle

async function getTotalMobil(req, res) {
  try {
    const decodedToken = jwt.verify(req.cookies.token, "secret_key");
    const id_user = decodedToken.userId;
    const sql = "SELECT COUNT(*) AS count FROM mobil WHERE id_user = ?";
    const result = await query(sql, [id_user]);
    console.log(id_user)

    if (result.length === 0 || !result[0].count) {
      return res.status(404).json({ msg: "Data tidak ditemukan" });
    }

    return res.json(result[0].count);
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      return res.status(401).json("Token telah kedaluwarsa");
    }
    return res
      .status(500)
      .json("Ada kesalahan dalam verifikasi token atau query SQL");
  }
}

async function getTotalMotor(req, res) {
  try {
    const decodedToken = jwt.verify(req.cookies.token, "secret_key");
    const id_user = decodedToken.userId;
    const sql = "SELECT COUNT(*) AS count FROM motor WHERE id_user = ?";
    const result = await query(sql, [id_user]);

    if (result.length === 0 || !result[0].count) {
      return res.status(404).json({ msg: "Data tidak ditemukan" });
    }

    return res.json(result[0].count);
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      return res.status(401).json("Token telah kedaluwarsa");
    }
    return res
      .status(500)
      .json("Ada kesalahan dalam verifikasi token atau query SQL");
  }
}

module.exports = {
  getMobilData,
  getMotorData,
  addMobilData,
  addMotorData,
  getMobilDataById,
  getMotorDataById,
  deleteMobilById,
  deleteMotorById,
  getTotalMobil,
  getTotalMotor,
};
