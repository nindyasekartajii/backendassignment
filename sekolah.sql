-- Membuat tabel siswa
CREATE TABLE siswa (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  umur INT,
  jurusan VARCHAR(50)
);

-- Membuat tabel nilai
CREATE TABLE nilai (
  id SERIAL PRIMARY KEY,
  siswa_id INT REFERENCES siswa(id),
  mata_pelajaran VARCHAR(100),
  nilai INT
);

-- Isi data siswa
INSERT INTO siswa (nama, umur, jurusan)
VALUES 
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Citra', 16, 'IPA'),
('Dewi', 17, 'IPS'),
('Eko', 16, 'IPA');

-- Isi data nilai
INSERT INTO nilai (siswa_id, mata_pelajaran, nilai)
VALUES 
(1, 'Matematika', 85),
(2, 'Bahasa Inggris', 90),
(3, 'Fisika', 88),
(4, 'Ekonomi', 75),
(5, 'Biologi', 92);

-- Query SELECT
SELECT * FROM siswa;
SELECT nama FROM siswa WHERE jurusan = 'IPA';
SELECT siswa.nama, AVG(nilai.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.siswa_id
GROUP BY siswa.nama;

-- Update data
UPDATE siswa SET jurusan = 'Bahasa' WHERE nama = 'Budi';

-- Delete data
DELETE FROM nilai WHERE siswa_id = 3 AND mata_pelajaran = 'Fisika';