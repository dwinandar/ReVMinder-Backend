const query = require("../database");

const addService = async (req, res) => {
  const id = req.params.id;
  const { tanggal, jarak, biaya, kategori, dikerjakan, keterangan } = req.body;

  const result = await query(
    `INSERT INTO layanan (tanggal, jarak, biaya, kategori, dikerjakan, keterangan) VALUES ( ?, ?, ?, ? , ? , ?)`,
    [tanggal, jarak, biaya, kategori, dikerjakan, keterangan],
  );
  if (result) {
    return res.status(200).json(result);
  } else {
    return res.json("Gagal menambahkan layanan");
  }
};

// get Mobil by id

const getMobilById = (req, res) => {
  const idMobil = req.params.id;
  const sql = ` SELECT * FROM layanan WHERE id = ?`;

  query(sql, [idMobil]);
  return res.json(result);
};
