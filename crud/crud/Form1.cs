using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace crud
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Conexion c = new Conexion();
            c.llenarComputadoras(cbCompu);
            c.llenarProyectos(cbProyecto);
            c.llenarTencio(cbTecnico);
            mostrarDatos();
        }

        SPElevatecDataContext db = new SPElevatecDataContext();
        private void btnInsertar_Click(object sender, EventArgs e)
        {
            /*Variable para realizar el sp de insercion de datos a la table de registro*/
            var spInsert = db.sp_computerInsert(int.Parse(tbID.Text), cbCompu.Text, DateTime.Parse(dateEntrada.Text), DateTime.Parse(dateSalida.Text), cbProyecto.Text, cbTecnico.Text,tbObservacion.Text);
            MessageBox.Show("Registro ingresado");
            mostrarDatos();
        }

        /*Se crea un metodo para mostrar todos los datos en el Datagrid*/
        void mostrarDatos()
        {
            /*Variable para realizar el sp de mostrar datos de la tabla*/
            var spMostrar = db.sp_computerList();
            dataGridView1.DataSource = spMostrar;
        }

        /*metodo para actualizar registro de la DB*/
        private void btnActualizar_Click(object sender, EventArgs e)
        {
            var spUodate = db.sp_computerUPDATE(int.Parse(tbID.Text), cbCompu.Text, DateTime.Parse(dateEntrada.Text), DateTime.Parse(dateSalida.Text), cbProyecto.Text, cbTecnico.Text, tbObservacion.Text);
            MessageBox.Show("Registro Actualizado");
            mostrarDatos();
        }

        /*metodo para eliminar registro de la DB*/
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            /*Se crea un condicional para validar la accion de eliminar*/
            if (MessageBox.Show("¿Quiere eliminar este registro?","Eliminar registro", MessageBoxButtons.YesNo)==DialogResult.Yes)
            {
                var spDelete = db.sp_computerDELETE(int.Parse(tbID.Text));
                MessageBox.Show("Registro Eliminado");
                mostrarDatos();
            }
            
        }

        /*metodo para buscar registro con su Id*/
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (tbID.Text!="")
            {
                var spSearch = db.sp_computerSearch(int.Parse(tbID.Text));
                dataGridView1.DataSource = spSearch;
            }
            else
            {
                MessageBox.Show("Escriba el ID del registro a buscar");
            }
            
        }
    }
}
