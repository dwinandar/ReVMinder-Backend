const query = require("../database");

const addService = async (req, res) => {
  const id = req.params.id;
  const vehicle = req.params.vehicle;
  const { tanggal, jarak, biaya, kategori, dikerjakan, keterangan } = req.body;

  const result = await query(
    `INSERT INTO layanan_${vehicle} (tanggal, jarak, biaya, kategori, dikerjakan, keterangan, id_${vehicle}) VALUES (?, ?, ?, ?, ? , ? , ?)`,
    [tanggal, jarak, biaya, kategori, dikerjakan, keterangan, id]
  );
  // const result = await query(
  //   `INSERT INTO layanan (id_kendaraan, tanggal, jarak, biaya, kategori, dikerjakan, keterangan) VALUES (?, ?, ?, ?, ? , ? , ?)`,
  //   [id, tanggal, jarak, biaya, kategori, dikerjakan, keterangan],
  // );
  if (result) {
    console.log(result);
    return res.status(201).json(result);
  } else {
    return res.json("Gagal menambahkan layanan");
  }
};

const getService = async (req, res) => {
  const id = req.params.id;
  const vehicle = req.params.vehicle
  const result = await query(
    `SELECT * FROM layanan_${vehicle} WHERE id_${vehicle}= ?`
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


const addPengingat = async (req, res) => {
  const id = req.params.id;
  const vehicle = req.params.vehicle;

  const { tanggal, kategori, ingatkan } = req.body;

  const result = await query(
    `INSERT INTO pengingat_${vehicle} ( id_${vehicle}, tanggal, kategori, ingatkan) VALUES (?, ?, ?, ?)`,
    [id, tanggal, kategori, ingatkan]
  );

  if (result) {
    console.log(result);
    return res.status(201).json(result);
  } else {
    return res.json("Gagal menambahkan pengingat");
  }


}

const getPengingat = async (req, res) => {
  const id = req.params.id;
  const vehicle = req.params.vehicle;

  const result = await query(
    `SELECT tanggal, kategori, ingatkan FROM pengingat_${vehicle} WHERE id_${vehicle} = ?`
    ,
    [id]
  );
  console.log(result);

  if (result) {
    console.log(result);
    return res.status(201).json(result);
  } else {
    return res.json("Gagal menampilkan pengingat");
  }

}


module.exports = {
  addService,
  getService,
  getMobilById,
  addPengingat,
  getPengingat
}
