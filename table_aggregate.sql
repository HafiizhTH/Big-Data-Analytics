-- Total penjualan per produk
CREATE TABLE `total_penjualan_per_produk`AS
  SELECT
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') AS 'tanggal',
    `id_barang`,
    `nama_barang`,
    `unit`,
    `harga`,
    `jumlah_barang`,
    SUM(`harga` * `jumlah_barang`) AS 'total_penjualan'
  FROM
    `data_mart`
  WHERE
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') BETWEEN '2022-01-01' AND '2022-01-31'
  GROUP BY
    `tanggal`, `id_barang`;
	
		
				
-- Jumlah transaksi per pelanggan
CREATE TABLE `jumlah_transaksi_per_pelanggan`AS
  SELECT
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') AS 'tanggal',
    `id_customer`,
    `nama_barang`,
    `cabang_sales`,
    COUNT(*) AS 'jumlah_transaksi'
  FROM
    `data_mart`
  WHERE
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') BETWEEN '2022-04-01' AND '2022-04-31'
  GROUP BY
    `tanggal`, `id_customer`;
		
		
		
-- Pendapatan per bulan
CREATE TABLE `pendapatan_per_bulan`AS
  SELECT
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') AS 'tanggal',
    `id_barang`,
    `nama_barang`,
    `unit`,
    `harga`,
    `mata_uang`,
    `jumlah_barang`,
    SUM(`harga` * `jumlah_barang`) AS 'total_pendapatan'
  FROM
    `data_mart`
  WHERE
    DATE_FORMAT(`tanggal`, '%Y-%m-%d') BETWEEN '2022-06-01' AND '2022-06-31'
  GROUP BY
    `tanggal`, `nama_barang`;