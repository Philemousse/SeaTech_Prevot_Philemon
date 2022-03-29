using ExtendedSerialPort;
using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RobotInterface
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ReliableSerialPort serialPort1;
        public MainWindow()
        {
            InitializeComponent();
            serialPort1 = new ReliableSerialPort("COM8", 115200, Parity.None, 8, StopBits.One);
            serialPort1.Open();
            serialPort1.DataReceived += serialPort1_DataReceived;
        }

        private void textboxEmission_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
        bool bouton = false;
        private void buttonEnvoyer_Click(object sender, RoutedEventArgs e)
        {
            if (bouton == false)
            {
                buttonEnvoyer.Background = Brushes.RoyalBlue;
                bouton = true;
            }
            else
            {
                buttonEnvoyer.Background = Brushes.Beige;
                bouton = false;
            }
            Sendmessage();
            

        }
        private void Sendmessage()
        {
            textboxReception.Text += "Reçu : " + textboxEmission.Text + "\n";
            serialPort1.WriteLine(textboxReception.Text);
            textboxEmission.Text = "";
        }

        private void textboxEmission_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
               Sendmessage();
            }
        }

        public void serialPort1_DataReceived(object sender, DataReceivedArgs e)
        {
            textboxReception.Text += Encoding.UTF8.GetString(e.Data, 0, e.Data.Length);
        }
    }
}
