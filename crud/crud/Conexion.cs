using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace crud
{
    class Conexion
    {
        SqlConnection cnn;
        SqlCommand cmd;
        SqlDataReader dr;

        /*Se crea un constructor para crear la cadena de conexion de la DB*/
        /*Un constructor debe tener siempre el mismo nombre de la clase*/
        public Conexion()
        {
            try
            {
                cnn = new SqlConnection("Data Source=DESKTOP-QETR9PD;Initial Catalog=CRUDELEVATEC;Integrated Security=True");
                cnn.Open();
                MessageBox.Show("Conexion exitosa");
            }
            catch(Exception ex)
            {
                MessageBox.Show("fallo conexion");
            }
        }

        /*Se crear un metodo para llenar el comboBox 1*/
        public void llenarComputadoras(ComboBox cb1)
        {
            try
            {
                cmd = new SqlCommand("SELECT nombreCompu From Computadora", cnn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cb1.Items.Add(dr["nombreCompu"].ToString());
                }
                dr.Close();
            }catch(Exception ex)
            {
                MessageBox.Show("No se lleno el combo box" + ex.ToString());
            }
        }

        /*Se crea el segundo metodo para llenar el comboBox2*/
        public void llenarProyectos(ComboBox cb2)
        {
            try
            {
                cmd = new SqlCommand("SELECT nombreProyecto From Proyecto", cnn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cb2.Items.Add(dr["nombreProyecto"].ToString());
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se lleno el combo box" + ex.ToString());
            }
        }

        /*Se crea el segundo metodo para llenar el comboBox3*/
        public void llenarTencio(ComboBox cb3)
        {
            try
            {
                cmd = new SqlCommand("SELECT nombreTecnico From Tecnico", cnn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cb3.Items.Add(dr["nombreTecnico"].ToString());
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se lleno el combo box" + ex.ToString());
            }
        }
    }
}
