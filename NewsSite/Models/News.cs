using System.ComponentModel.DataAnnotations;

namespace NewsSite.Models.Membership
{
    [MetadataType(typeof (NewsMetadata))]
    public partial class News
    {
        public class NewsMetadata
        {
            [ScaffoldColumn(false)]
            public int NewId { get; set; }

            [Required(ErrorMessage = "Загловок не должен быть пустым")]
            [StringLength(100, ErrorMessage = "Слишком большой заголовок")]
            public string Title { get; set; }

            [Required(ErrorMessage = "Потеряна дата написания статьи")]
            public string Date { get; set; }

            [Required(ErrorMessage = "Краткое описание является обязательным")]
            public string BriefDescription { get; set; }

            [Required(ErrorMessage = "Полное описание является обязательным")]
            public string FullText { get; set; }

            public string PictureUrl { get; set; }
        }
    }
}