<template>
<div>

  <search @search="handleSearch"></search>

  <div class="main-box">

    <div class="block" style="width: 1200px ;margin: 10px auto">
    <!--      类别菜单-->
      <div class="good-menu">
        <ul>
          <li v-for="(item, index) in icons" :key="index">
            <!-- 遍历每个 item 下的 icons -->
            <span v-for="(icon, iconIndex) in item.icons" :key="'icon-' + iconIndex">
        <i class="iconfont" v-html="icon"></i>
      </span>

            <!-- 遍历每个 item 下的 categories -->
            <span v-for="(category, catIndex) in item.categories" :key="'category-' + catIndex">
        <router-link :to="{ path: '/goodlist', query: { categoryId: category.id } }">
          <span>{{ category.name }}</span>
        </router-link>

              <!-- 在分类之间添加 " / " 分隔符，除最后一个外 -->
        <span v-if="catIndex < item.categories.length - 1"> / </span>
      </span>
          </li>
        </ul>
      </div>


      <!--轮播图-->
      <div>
        <el-carousel height="370px" style="border-radius:20px;width: 600px">
          <el-carousel-item v-for="carousel in carousels" :key="carousel.id">
            <router-link :to="'/goodview/'+carousel.goodId">
              <img style="height: 370px;width: 600px;" :src="carousel.img"/>
            </router-link>
          </el-carousel-item>
        </el-carousel>
      </div>

    </div>

    <!--推荐商品-->
    <div style="margin-top: 30px">
      <span style="color: #5effd1">推荐商品</span>
    </div>

    <div style="width: 1300px;margin: 20px auto;">
      <el-row :gutter="20">
        <el-col :span="6" v-for="good in good" :key="good.id" style="margin-bottom: 20px ">
          <router-link :to="'goodview/'+good.id">
            <el-card :body-style="{ padding: '0px',background: '#e3f5f4' }">
              <img :src="good.imgs" style="width: 100%;height: 300px">
              <div style="padding:5px 10px;">
                <span style="font-size: 18px">{{good.name}}</span><br/>
                <span style="color: red;font-size: 15px">￥{{ good.price }}</span>
              </div>
            </el-card>
          </router-link>
        </el-col>
      </el-row>
    </div>
  </div>

</div>
</template>

<script>
import search from "../../components/Search"
export default {
  name: "TopView",
  data(){
    return{
      //轮播图
      carousels: [],
      //推荐商品
      good:[],

      //分类icon，每个icon包含id、value、categories对象数组.category：id，name
      icons:[],
      //搜索内容
      searchText:'',
    }
  },
  components:{
    search,
  },
  created() {
      this.request.get("/api/good").then(res=>{
            if(res.code==='200'){
              this.good = res.data;
            }else {
              this.$message.error(res.msg);
            }
          }
      )
    this.request.get("/api/icon").then(res=>{
      if(res.code==='200'){
        this.icons = res.data;
      }
    })
    this.request.get("/api/carousel").then(res=>{
      if(res.code==='200'){
        this.carousels = res.data;
      }
    })
  },
  methods:{
    handleSearch(text){
      this.searchText = text;
      this.$router.push({path:'/goodList',query:{searchText: this.searchText}})
    }
  }
}
</script>

<style scoped>
@import "../../resource/css/icon.css";
.main-box{
  background-color: white;
  width: 1300px;
  border: white 2px solid;
  border-radius: 40px;
  padding: 20px 40px;
  margin: 5px auto;
}
.good-menu{
  float: left;
  height: 350px;
  margin-right: 130px;
}
.good-menu li{
  list-style: none;
  overflow: hidden;
  margin-bottom: 35px;

}
.good-menu li a,span{
  font-size: 20px;
  color: #6c6969;
}
.good-menu a span:hover{
  color: #00b7ff;
}

</style>