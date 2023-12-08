const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "revminder",
});

async function query(query, value) {
  try {
    const [executeQuery] = await db.query(query, value ?? []); // hasil dari query
    return executeQuery;
  } catch (error) {
    console.log(error);
  }
}

module.exports = query;
