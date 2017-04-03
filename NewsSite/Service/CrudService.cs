using System.Data;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using NewsSite.Models.Membership;

// Нужно реализовывать определение таблицы
// Нужно реализовывать поиск сущности по id

namespace NewsSite.Service
{
    public abstract class CrudService<T> : IService where T : EntityObject
    {
        protected MyEntities db = new MyEntities();

        // Перенести определение таблицы сюда
        protected ObjectSet<T> Table;

        public abstract T GetObjectById(int id);

        public void UpdateObject(T obj)
        {
            db.ObjectStateManager.ChangeObjectState(obj, EntityState.Modified);
            db.SaveChanges();
        }

        public void UpdateAndAttachObject(T obj)
        {
            Table.Attach(obj);
            UpdateObject(obj);
        }

        public void DeleteObject(T obj)
        {
            Table.DeleteObject(obj);
            db.SaveChanges();
        }

        public void SaveObject(T obj)
        {
            Table.AddObject(obj);
            db.SaveChanges();
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }
}