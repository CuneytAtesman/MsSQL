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
    public partial class frm_Ana_Sayfa : Form
    {
        public frm_Ana_Sayfa()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=NINJACLUB\CNYTMSSQLSERVER;Initial Catalog=SatisVT;Integrated Security=True");

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            // Ürünlerin durum seviyesi
            SqlCommand komut=new SqlCommand("Execute stokkritikseviye", baglanti);
            SqlDataAdapter da=new SqlDataAdapter(komut);
            DataTable dt=new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource= dt;

            // Grafiğe veri çekme işlemi gerçekleştirelim.

            //chart1.Series["Kategoriler"].Points.AddXY("Adana", 24);
            //chart1.Series["Kategoriler"].Points.AddXY("Isparta", 20);

            baglanti.Open();

            SqlCommand komut2 = new SqlCommand("Select KATEGORIAD,COUNT(*) FROM TBLKATEGORI INNER JOIN TBLURUNLER ON TBLKATEGORI.KATEGORIID=TBLURUNLER.KATEGORI GROUP BY KATEGORIAD", baglanti);
            SqlDataReader dr = komut2.ExecuteReader();
            while (dr.Read())
            {
                chart1.Series["Kategoriler"].Points.AddXY(dr[0], dr[1]);
            }
            baglanti.Close();



            baglanti.Open();

            SqlCommand komut3 = new SqlCommand("Select MUSTERIULKE,COUNT(*)from TBLMUSTERI group by MUSTERIULKE", baglanti);
            SqlDataReader dr3 = komut3.ExecuteReader();
            while (dr3.Read())
            {
                chart2.Series["sehirler"].Points.AddXY(dr3[0], dr3[1]);
            }
            baglanti.Close();
        }

        private void btn_kategoriler_Click(object sender, EventArgs e)
        {
            frm_kategori_ayarlari fr = new frm_kategori_ayarlari();
            fr.Show();
        }

        private void btn_musteriler_Click(object sender, EventArgs e)
        {
            frm_musteri fr2 = new frm_musteri();
            fr2.Show();
        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }
    }
}
