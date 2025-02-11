<template>
  <div class="news-section">
    <h2 class="news-title">HOME NEWS</h2>
    <h3 class="news-subtitle">商品资讯</h3>

    <div class="news-grid">
      <div class="news-card" v-for="(news, index) in fitnessNews" :key="index">
        <img :src="news.image" alt="news image" class="news-image" />
        <div class="news-content">
          <h4 class="news-text">{{ news.title }}</h4>
          <p class="news-date">{{ news.date }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import fitnessImage from '@/static/YRhtE9bW5O_small.jpg';
import fitnessImage1 from '@/static/0dcb8e28038acb3a71add112908d8b5d.jpg';
import fitnessImage2 from '@/static/dab1-hmhafir4775897.jpg';
import fitnessImage3 from '@/static/01ec9b5c1c5c65a8012029acc6fcf9.jpg';
export default {
  data() {
    return {
      fitnessNews: [
        {
          title: "2024年中国体育用品行业市场供需现状分析",
          image: fitnessImage,
          date: "2024-011-08 17:12:15"
        },
        {
          title: "运动健身市场爆发！哪些器材最受欢迎？",
          image: fitnessImage1,
          date: "2024-03-08 17:12:15"
        },
        {
          title: "羽毛球装备推荐：如何选择合适的球拍？",
          image: fitnessImage2,
          date: "2024-03-08 17:12:15"
        },
        {
          title: "健身房新趋势：智能健身设备崛起",
          image: fitnessImage3,
          date: "2024-03-08 17:12:15"
        }
      ]
    };
  }
};
</script>

<style scoped>
/* 新闻区域整体样式 */
.news-section {
  text-align: center;
  padding: 20px;
}

/* 标题样式 */
.news-title {
  font-size: 24px;
  font-weight: bold;
}

.news-subtitle {
  font-size: 18px;
  color: gray;
  margin-bottom: 20px;
}

/* 网格布局 */
.news-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 两列布局 */
  gap: 20px; /* 间距 */
  justify-content: center;
  padding: 0 10%;
}

/* 新闻卡片 */
.news-card {
  display: flex;
  align-items: center;
  background: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
}

.news-card:hover {
  transform: translateY(-5px);
}

/* 新闻图片 */
.news-image {
  width: 40%; /* 图片占左侧 40% */
  height: 100%;
  object-fit: cover;
}

/* 文字内容区域 */
.news-content {
  padding: 10px;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

/* 标题 */
.news-text {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 5px;
}

/* 日期 */
.news-date {
  font-size: 14px;
  color: gray;
}
</style>
