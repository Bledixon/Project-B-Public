namespace wServer.realm.worlds
{
    public class Test : World
    {
        public string js = null;

        public Test()
        {
            Id = TEST_ID;
            Name = "Editor";
            Background = 0;
            Difficulty = 5;
            SetMusic("Island");
            SetRemovalMS(10 * 60 * 1000);
        }

        public void LoadJson(string json)
        {
            js = json;
            LoadMap(json);
        }
    }
}