using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DungeonLibrary
{
    public class Dungeons
    {
        int cellsNum;
        int prisonerNum;
        double cellsArea;
        Random rnd = new Random();

        public int CellsNum
        { get { return cellsNum; } set { cellsNum = value; } }

        public int PrisonerNum 
        { get { return prisonerNum; } set { prisonerNum = value; } }

        public double CellsArea
        { get { return cellsArea; } set { cellsArea = value; } }

        public double PrisonerArea()
        {
            return cellsArea / prisonerNum;
        }

        public void UpdatePrisonerNum()
        {
            prisonerNum -= rnd.Next(1, 3); 
        }
        public void AddPrisonerNum()
        {
            ++prisonerNum;
        }

    }
}
