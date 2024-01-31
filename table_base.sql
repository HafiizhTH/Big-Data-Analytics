CREATE TABLE `data_mart`AS
  SELECT
    CONCAT(`pjl`.`id_invoice`, '_', `pjl`.`id_barang`) AS 'id_penjualan',
    `pjl`.`id_invoice`,
    `pjl`.`tanggal`,
    `pjl`.`id_barang`,
    `brg`.`nama_barang`,
    `pjl`.`harga`,
    `pjl`.`unit`,
    `pjl`.`jumlah_barang`,
    (`jumlah_barang` * `pjl`.`harga`) AS 'total_harga_per_barang',
    `pjl`.`mata_uang`,
    `pjl`.`id_customer`,
    `plg`.`nama` AS 'nama_customer',
    `plg`.`cabang_sales`,
    `plg`.`group` AS 'group_category'
  FROM
    `penjualan` pjl
      LEFT JOIN `barang` brg ON (`pjl`.`id_barang` = `brg`.`kode_barang`)
      LEFT JOIN `pelanggan` plg ON (`pjl`.`id_customer` = `plg`.`id_customer`);