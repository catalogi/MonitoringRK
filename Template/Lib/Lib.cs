namespace Ririn.Lib
{
    public class Lib
    {
        public static string SaveBase64(Byte[] bytes, string path)
        {
            try
            {
                System.IO.File.WriteAllBytes(path, bytes);
                return path;
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
