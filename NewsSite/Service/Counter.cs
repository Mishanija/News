using System;
using System.IO;

namespace NewsSite.Service
{
    public class Counter
    {
        private static readonly string CounterDirectory = AppDomain.CurrentDomain.BaseDirectory + "Service";
        private static string _textFile;

        private int _counter;
        private readonly ParamReader _paramReader = new ParamReader(_textFile);

        public Counter(string fileName)
        {
            _textFile = CounterDirectory + "\\" + fileName;
        }

        public int GetNumber()
        {
            try
            {
                _counter = Convert.ToInt32(_paramReader.ReadParam());
            }
            catch (FileNotFoundException)
            {
                CreateCounter();
            }
            File.WriteAllText(_textFile, ++_counter + "");
            return _counter;
        }

        private void CreateCounter()
        {
            Directory.CreateDirectory(CounterDirectory);
            _counter = 1000;
        }
    }
}