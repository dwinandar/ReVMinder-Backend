const query = require("../database");

const addService = async (req, res) => {
  const id = req.params.id;
  const { tanggal, jarak, biaya, kategori, dikerjakan, keterangan } = req.body;

  const result = await query(
    `INSERT INTO layanan (id_kendaraan, tanggal, jarak, biaya, kategori, dikerjakan, keterangan) VALUES (?, ?, ?, ?, ? , ? , ?)`,
    [id, tanggal, jarak, biaya, kategori, dikerjakan, keterangan],
  );
  if (result) {
    console.log(result);
    return res.status(201).json(result);
  } else {
    return res.json("Gagal menambahkan layanan");
  }
};

const getService = async (req, res) => {
  const id = req.params.id;
  const result = await query(
    `SELECT * FROM layanan WHERE id_kendaraan= ?`
    , [id]
  );
  if (result) {
    console.log(result);
    return res.status(200).json(result);
  } else {
    return res.json("Belum ada riwayat");
  }
}

// get Mobil by id
const getMobilById = async (req, res) => {
  const idMobil = req.params.id;
  const sql = ` SELECT * FROM layanan WHERE id = ?`;

  query(sql, [idMobil]);
  return res.json(result);
};



module.exports = {
  addService,
  getService,
  getMobilById
}
