using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.DataVisualization.Charting;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PaymentsExampleApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private PaymentsBaseEntities _context = new PaymentsBaseEntities();
        public MainWindow()
        {
            InitializeComponent();
            ChartPayments.ChartAreas.Add(new ChartArea("Main"));

            var currentSeries = new Series("Payments")
            {
                IsValueShownAsLabel = true
            };
            ChartPayments.Series.Add(currentSeries);

            ComboUsers.ItemsSource = _context.User.ToList();
            ComboChartTypes.ItemsSource = Enum.GetValues(typeof(SeriesChartType));

            
        }
        private void UpdateCharts(object sender, SelectionChangedEventArgs e)
        {
            if (ComboUsers.SelectedItem is User сurrentUser && ComboChartTypes.SelectedItem is SeriesChartType currentType) 
            {
                Series currentSeries = ChartPayments.Series.FirstOrDefault();
                currentSeries.ChartType = currentType;
                currentSeries.Points.Clear();

                var categoriesList =  _context.Category.ToList();
                foreach (var category in categoriesList)
                {
                    currentSeries.Points.AddXY(category.Name, _context.Payment.ToList().Where(p => p.User == сurrentUser && p.Category == category).Sum(p => p.Price * p.Num));
                }
            }
        }
    }
}
