using System;
using System.Collections.Generic;
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
using DungeonLibrary;

namespace Dungeon
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        Dungeons dungeon1 = new Dungeons();
        String logs;
        int k;

        public MainWindow()
        {
            InitializeComponent();
        }


        private void UpdatePrisoner_Click(object sender, RoutedEventArgs e)
        {
            int qcount = dungeon1.PrisonerNum;
            dungeon1.UpdatePrisonerNum();
            logs += ("Сбежало " + Convert.ToString(qcount - dungeon1.PrisonerNum) + " заключенных \n");
            logs += ("Всего " + Convert.ToString(dungeon1.PrisonerNum) + " заключенных \n");
            logs += ("Плозадь на 1 заключенного" + Convert.ToString(dungeon1.PrisonerArea()) + " кв.м/заключенных \n");
            Update();
        }

        private void Update()
        {
            ListPrisoner.Content = logs;
            ++k1;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dungeon1.AddPrisonerNum();
            logs += ("Добавился один заключенный \n");
            logs += ("Всего " + Convert.ToString(dungeon1.PrisonerNum) + " заключенных \n");
            logs += ("Плозадь на 1 заключенного" + Convert.ToString(dungeon1.PrisonerArea()) + " кв.м/заключенных \n");
            Update();
        }

        private void InputPrisoners_TextChanged(object sender, TextChangedEventArgs e)
        {
           
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (k == 0)
            {
                dungeon1.PrisonerNum = Convert.ToInt32(InputPrisoners.Text);
                Label1.Content = "Введите площадь темницы";
                InputPrisoners.Text = "";
            }
            else if (k == 1)
            {
                dungeon1.CellsArea = Convert.ToInt32(InputPrisoners.Text);
                InputPrisoners.Visibility = Visibility.Hidden;
                Confirm.Visibility = Visibility.Hidden;
                Label1.Visibility = Visibility.Hidden;
                
            }


            ++k;
        }
    }
}
