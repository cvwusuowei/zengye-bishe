<template>
  <div class="error-container">
    <h1 class="error-code">404</h1>
    <p class="error-text">Got lost? How.....? why.....? Ahhhh....</p>
    <router-link to="/" class="home-link">返回首页</router-link>
  </div>
</template>

<script>
export default {
  name: "NotFoundPage",
};
</script>

<style scoped>
/* 让整个页面居中，背景色黑色 */
.error-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-color: #000;
  color: white;
  text-align: center;
}

/* 404 文字 */
.error-code {
  font-size: 100px;
  font-weight: bold;
  text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.3);
  animation: shake 0.3s infinite alternate;
}

/* 提示文字 */
.error-text {
  font-size: 20px;
  color: #1EA7AB;
  margin-top: 10px;
  animation: fadeIn 2s infinite alternate;
}

/* 返回首页按钮 */
.home-link {
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 18px;
  color: white;
  text-decoration: none;
  background-color: #1EA7AB;
  border-radius: 5px;
  transition: 0.3s;
}

.home-link:hover {
  background-color: #147e78;
}

/* 404 抖动动画 */
@keyframes shake {
  from {
    transform: translateX(-2px);
  }
  to {
    transform: translateX(2px);
  }
}

/* 文字淡入淡出动画 */
@keyframes fadeIn {
  from {
    opacity: 0.5;
  }
  to {
    opacity: 1;
  }
}
</style>
