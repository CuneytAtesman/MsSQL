using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Proje_SQL_DB

// Data Source=NINJACLUB\CNYTMSSQLSERVER;Initial Catalog=SatisVT;Integrated Security=True
{
    public partial class frm_kategori_ayarlari : Form
    {
        public frm_kategori_ayarlari()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=NINJACLUB\CNYTMSSQLSERVER;Initial Catalog=SatisVT;Integrated Security=True");
        private void btn_listele_Click(object sender, EventArgs e)
        {
            SqlCommand komut= new SqlCommand("select * from TBLKATEGORI", baglanti);
            SqlDataAdapter da= new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource= dt;
        }

        private void btn_kaydet_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut2 = new SqlCommand("insert into TBLKATEGORI (KATEGORIAD) values (@p1)", baglanti);
            komut2.Parameters.AddWithValue("@p1", txt_kategori_Ad.Text);
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Kategori Kaydetme İşlemi Başarıyla Gerçekleşti");



        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_kategori_ID.Text = dataGridView1.Rows [e.RowIndex].Cells [0].Value.ToString();
            txt_kategori_Ad.Text = dataGridView1.Rows [e.RowIndex].Cells [1].Value.ToString();
        }

        private void btn_sil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut3 = new SqlCommand("Delete from TBLKATEGORI where KATEGORIID=@p1", baglanti);
            komut3.Parameters.AddWithValue("@p1", txt_kategori_ID.Text);
            komut3.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Kategori Silme İşlemi Gerçekleşti");
        }

        private void btn_guncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut4 = new SqlCommand("Update TBLKATEGORI set KATEGORIAD=@p1 where KATEGORIID=@p2", baglanti);
            komut4.Parameters.AddWithValue("@p1", txt_kategori_Ad.Text);
            komut4.Parameters.AddWithValue("@p2", txt_kategori_ID.Text);
            komut4.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Kategori Güncelleme İşlemi Gerçekleşti");
        }
    }
}
