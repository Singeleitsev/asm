using System.Xml;
using static System.Math;
using static System.Console;

enum MemoryMode { GET, SET }
enum NeuronType { Hidden, Output }

namespace NeuralNetwork
{
    class InputLayer
    {
        private (double[], double[])[] _trainset = new(double[], double[])[]//да-да, массив кортежей из 2 массивов
        {
            (new double[]{ 0, 0 }, new double[]{ 0, 1 }),
            (new double[]{ 0, 1 }, new double[]{ 1, 0 }),
            (new double[]{ 1, 0 }, new double[]{ 1, 0 }),
            (new double[]{ 1, 1 }, new double[]{ 0, 1 })
        };
        //инкапсуляция едрид-мадрид
        public (double[], double[])[] Trainset { get => _trainset; }//такие няшные свойства нынче в C# 7
    }
    class Neuron
    {
        public Neuron(double[] inputs, double[] weights, NeuronType type)
        {
            _type = type;
            _weights = weights;
            _inputs = inputs;
        }
        private NeuronType _type;
        private double[] _weights;
        private double[] _inputs;
        public double[] Weights { get => _weights; set => _weights = value; }
        public double[] Inputs { get => _inputs; set => _inputs = value; }
        public double Output { get => Activator(_inputs, _weights); }
        private double Activator(double[] i, double[] w)//преобразования
        {
            double sum = 0;
            for (int l = 0; l < i.Length; ++l)
                sum += i[l] * w[l];//линейные
            return Pow(1 + Exp(-sum), -1);//нелинейные
        }
        public double Derivativator(double outsignal) => outsignal * (1 - outsignal);//формула производной для текущей функции активации уже выведена в ранее упомянутой книге
        public double Gradientor(double error, double dif, double g_sum) => (_type == NeuronType.Output) ? error * dif : g_sum * dif;//g_sum - это сумма градиентов следующего слоя
    }
    abstract class Layer//модификаторы protected стоят для внутрииерархического использования членов класса
    {//type используется для связи с одноимённым полю слоя файлом памяти
        protected Layer(int non, int nopn, NeuronType nt, string type)
        {//увидите это в WeightInitialize
            numofneurons = non;
            numofprevneurons = nopn;
            Neurons = new Neuron[non];
            double[,] Weights = WeightInitialize(MemoryMode.GET, type);
            for (int i = 0; i < non; ++i)
            {
                double[] temp_weights = new double[nopn];
                for (int j = 0; j < nopn; ++j)
                    temp_weights[j] = Weights[i, j];
                Neurons[i] = new Neuron(null, temp_weights, nt);//про подачу null на входы ниже
            }
        }
        protected int numofneurons;//число нейронов текущего слоя
        protected int numofprevneurons;//число нейронов предыдущего слоя
        protected const double learningrate = 0.1d;//скорость обучения
        Neuron[] _neurons;
        public Neuron[] Neurons { get => _neurons; set => _neurons = value; }
        public double[] Data//я подал null на входы нейронов, так как
        {//сначала нужно будет преобразовать информацию
            set//(видео, изображения, etc.)
            {//а загружать input'ы нейронов слоя надо не сразу,
                for (int i = 0; i < Neurons.Length; ++i)
                    Neurons[i].Inputs = value;
            }//а только после вычисления выходов предыдущего слоя
        }
        public double[,] WeightInitialize(MemoryMode mm, string type)
        {
            double[,] _weights = new double[numofneurons, numofprevneurons];
            WriteLine($"{type} weights are being initialized...");
            XmlDocument memory_doc = new XmlDocument();
            memory_doc.Load($"{type}_memory.xml");
            XmlElement memory_el = memory_doc.DocumentElement;
            switch (mm)
            {
                case MemoryMode.GET:
                    for (int l = 0; l < _weights.GetLength(0); ++l)
                        for (int k = 0; k < _weights.GetLength(1); ++k)
                            _weights[l, k] = double.Parse(memory_el.ChildNodes.Item(k + _weights.GetLength(1) * l).InnerText.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);//parsing stuff
                    break;
                case MemoryMode.SET:
                    for (int l = 0; l < Neurons.Length; ++l)
                        for (int k = 0; k < numofprevneurons; ++k)
                            memory_el.ChildNodes.Item(k + numofprevneurons * l).InnerText = Neurons[l].Weights[k].ToString();
                    break;
            }
            memory_doc.Save($"{type}_memory.xml");
            WriteLine($"{type} weights have been initialized...");
            return _weights;
        }
        abstract public void Recognize(Network net, Layer nextLayer);//для прямых проходов
        abstract public double[] BackwardPass(double[] stuff);//и обратных
    }
    class HiddenLayer : Layer
    {
        public HiddenLayer(int non, int nopn, NeuronType nt, string type) : base(non, nopn, nt, type) { }
        public override void Recognize(Network net, Layer nextLayer)
        {
            double[] hidden_out = new double[Neurons.Length];
            for (int i = 0; i < Neurons.Length; ++i)
                hidden_out[i] = Neurons[i].Output;
            nextLayer.Data = hidden_out;
        }
        public override double[] BackwardPass(double[] gr_sums)
        {
            double[] gr_sum = null;
            //сюда можно всунуть вычисление градиентных сумм для других скрытых слоёв
            //но градиенты будут вычисляться по-другому, то есть
            //через градиентные суммы следующего слоя и производные
            for (int i = 0; i < numofneurons; ++i)
                for (int n = 0; n < numofprevneurons; ++n)
                    Neurons[i].Weights[n] += learningrate * Neurons[i].Inputs[n] * Neurons[i].Gradientor(0, Neurons[i].Derivativator(Neurons[i].Output), gr_sums[i]);//коррекция весов
            return gr_sum;
        }
    }
    class OutputLayer : Layer
    {
        public OutputLayer(int non, int nopn, NeuronType nt, string type) : base(non, nopn, nt, type) { }
        public override void Recognize(Network net, Layer nextLayer)
        {
            for (int i = 0; i < Neurons.Length; ++i)
                net.fact[i] = Neurons[i].Output;
        }
        public override double[] BackwardPass(double[] errors)
        {
            double[] gr_sum = new double[numofprevneurons];
            for (int j = 0; j < gr_sum.Length; ++j)//вычисление градиентных сумм выходного слоя
            {
                double sum = 0;
                for (int k = 0; k < Neurons.Length; ++k)
                    sum += Neurons[k].Weights[j] * Neurons[k].Gradientor(errors[k], Neurons[k].Derivativator(Neurons[k].Output), 0);//через ошибку и производную
                gr_sum[j] = sum;
            }
            for (int i = 0; i < numofneurons; ++i)
                for (int n = 0; n < numofprevneurons; ++n)
                    Neurons[i].Weights[n] += learningrate * Neurons[i].Inputs[n] * Neurons[i].Gradientor(errors[i], Neurons[i].Derivativator(Neurons[i].Output), 0);//коррекция весов
            return gr_sum;
        }
    }
    class Network
    {
        //все слои сети
        InputLayer input_layer = new InputLayer();
        public HiddenLayer hidden_layer = new HiddenLayer(4, 2, NeuronType.Hidden, nameof(hidden_layer));
        public OutputLayer output_layer = new OutputLayer(2, 4, NeuronType.Output, nameof(output_layer));
        //массив для хранения выхода сети
        public double[] fact = new double[2];//не ругайте за 2 пожалуйста
        //ошибка одной итерации обучения
        double GetMSE(double[] errors)
        {
            double sum = 0;
            for (int i = 0; i < errors.Length; ++i)
                sum += Pow(errors[i], 2);
            return 0.5d * sum;
        }
        //ошибка эпохи
        double GetCost(double[] mses)
        {
            double sum = 0;
            for (int i = 0; i < mses.Length; ++i)
                sum += mses[i];
            return (sum / mses.Length);
        }
        //непосредственно обучение
        static void Train(Network net)//backpropagation method
        {
            const double threshold = 0.001d;//порог ошибки
            double[] temp_mses = new double[4];//массив для хранения ошибок итераций
            double temp_cost = 0;//текущее значение ошибки по эпохе
            do
            {
                for (int i = 0; i < net.input_layer.Trainset.Length; ++i)
                {
                    //прямой проход
                    net.hidden_layer.Data = net.input_layer.Trainset[i].Item1;
                    net.hidden_layer.Recognize(null, net.output_layer);
                    net.output_layer.Recognize(net, null);
                    //вычисление ошибки по итерации
                    double[] errors = new double[net.input_layer.Trainset[i].Item2.Length];
                    for (int x = 0; x < errors.Length; ++x)
                        errors[x] = net.input_layer.Trainset[i].Item2[x] - net.fact[x];
                    temp_mses[i] = net.GetMSE(errors);
                    //обратный проход и коррекция весов
                    double[] temp_gsums = net.output_layer.BackwardPass(errors);
                    net.hidden_layer.BackwardPass(temp_gsums);
                }
                temp_cost = net.GetCost(temp_mses);//вычисление ошибки по эпохе
                //debugging
                WriteLine($"{temp_cost}");
            } while (temp_cost > threshold);
            //загрузка скорректированных весов в "память"
            net.hidden_layer.WeightInitialize(MemoryMode.SET, nameof(hidden_layer));
            net.output_layer.WeightInitialize(MemoryMode.SET, nameof(output_layer));
        }
        //тестирование сети
        static void Test(Network net)
        {
            for (int i = 0; i < net.input_layer.Trainset.Length; ++i)
            {
                net.hidden_layer.Data = net.input_layer.Trainset[i].Item1;
                net.hidden_layer.Recognize(null, net.output_layer);
                net.output_layer.Recognize(net, null);
                for (int j = 0; j < net.fact.Length; ++j)
                    WriteLine($"{net.fact[j]}");
                WriteLine();
            }
        }
        //запуск сети
        static void Main(string[] args)
        {
            Network net = new Network();
            Train(net);
            Test(net);
            ReadKey();//чтоб консоль не закрывалась :)
        }
    }
}
