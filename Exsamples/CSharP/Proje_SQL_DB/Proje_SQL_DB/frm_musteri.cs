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
{
    public partial class frm_musteri : Form
    {
        public frm_musteri()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=NINJACLUB\CNYTMSSQLSERVER;Initial Catalog=SatisVT;Integrated Security=True");

        void Listele()
        {
            SqlCommand komut = new SqlCommand("Select * from TBLMUSTERI", baglanti);
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }


        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void frm_musteri_Load(object sender, EventArgs e)
        {
            Listele();

            baglanti.Open();
            SqlCommand komut1 = new SqlCommand("Select * from TBLSEHIR", baglanti);
            SqlDataReader dr = komut1.ExecuteReader();
            while (dr.Read())

            {
                cmb_Musteri_ulke.Items.Add(dr["ULKE"]);
            }
            baglanti.Close();
        }

        private void btn_listele_Click(object sender, EventArgs e)
        {
            Listele();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_musteri_ID.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txt_musteri_Ad.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txt_musteri_soyad.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            cmb_Musteri_ulke.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txt_musteri_bakiye.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txt_email.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txt_makina_ID.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
        }

        private void txt_musteri_soyad_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_kaydet_Click(object sender, EventArgs e)
        {
           
            baglanti.Open();
            SqlCommand komut = new SqlCommand("insert into TBLMUSTERI (MUSTERIAD,MUSTERISOYAD,MUSTERIULKE,MUSTERIBAKIYE,[MUSTERI EMAIL],MAKINAID) VALUES (@p1,@p2,@p3,@p4,@p5,@p6)",baglanti);
            komut.Parameters.AddWithValue("@p1", txt_musteri_Ad.Text);
            komut.Parameters.AddWithValue("@p2", txt_musteri_soyad.Text);
            komut.Parameters.AddWithValue("@p3", cmb_Musteri_ulke.Text);
            komut.Parameters.AddWithValue("@p4", decimal.Parse (txt_musteri_bakiye.Text));
            komut.Parameters.AddWithValue("@p5", txt_email.Text);
            komut.Parameters.AddWithValue("@p6", txt_makina_ID.Text);
            
            komut.ExecuteNonQuery(); 
            
            baglanti.Close();
            MessageBox.Show("Müşteri Sisteme Kaydedildi");
            Listele();



        }

        private void btn_sil_Click(object sender, EventArgs e)
        {
            
            baglanti.Open();
            SqlCommand komut = new SqlCommand("DELETE from TBLMUSTERI where MUSTERIID=@p1", baglanti);
            komut.Parameters.AddWithValue("@P1", txt_musteri_ID.Text);

            komut.ExecuteNonQuery();

            baglanti.Close();
            MessageBox.Show("Müşteri Silindi");
            Listele();

        }

        private void btn_guncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Update TBLMUSTERI set MUSTERIAD=@p1,MUSTERISOYAD=@p2,MUSTERIULKE=@p3,MUSTERIBAKIYE=@p4,[MUSTERI EMAIL]=@p5,MAKINAID=@p6  where MUSTERIID=@p7", baglanti);
            komut.Parameters.AddWithValue("@p1", txt_musteri_Ad.Text);
            komut.Parameters.AddWithValue("@p2", txt_musteri_soyad.Text);
            komut.Parameters.AddWithValue("@p3", cmb_Musteri_ulke.Text);
            komut.Parameters.AddWithValue("@p4", decimal.Parse(txt_musteri_bakiye.Text));
            komut.Parameters.AddWithValue("@p5", txt_email.Text);
            komut.Parameters.AddWithValue("@p6", txt_makina_ID.Text);
            komut.Parameters.AddWithValue("@p7", txt_musteri_ID.Text);

            komut.ExecuteNonQuery();

            baglanti.Close();
            MessageBox.Show("Müşteri Güncellendi");
            Listele();
        }

        private void btn_arama_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select * from TBLMUSTERI where MUSTERIAD=@p1", baglanti);
            komut.Parameters.AddWithValue("@p1", txt_musteri_Ad.Text);
            
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource= dt;
        }
    }  
}
