<template>
<div>

    <search @search="handleSearch"></search>
    <div class="main-box">
      <div style="width: 1300px;margin: 20px auto;">
        <el-row :gutter="20">
          <el-col :span="6" v-for="good in good" :key="good.id" style="margin-bottom: 20px ">
<!--            商品格子-->
            <router-link :to="'goodview/'+good.id">
              <el-card :body-style="{ padding: '0px',background: '#98d8e3' }">
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
<!--      分页-->
      <div class="block" style="text-align: center">
        <el-pagination
            background
            :hide-on-single-page="false"
            :current-page="currentPage"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total"
            @current-change="handleCurrentPage"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import search from "../../../components/Search"
export default {
  name: "GoodList",
  data(){
    return{
      total: 0,
      pageSize: 9,
      currentPage: 1,
      //选择的分类
      categoryId : Number,
      //搜索的内容
      searchText: '',
      good:[],
    }
  },
  components:{
    search,
  },
  created() {
    //二者一般不同时存在
    this.searchText = this.$route.query.searchText
    this.categoryId = this.$route.query.categoryId
    console.log(this.searchText)
    console.log(this.categoryId)
    this.load();
  },
  methods:{
    handleCurrentPage(currentPage){
      this.currentPage = currentPage;
      this.load();
    },
    handleSearch(text){
      this.searchText = text;
      this.load();
    },
    load(){
      this.request.get("/api/good/page",{
        params:{
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          searchText: this.searchText,
          categoryId: this.categoryId,
        }
      }).then(res=>{
        if(res.code==='200'){
          this.total = res.data.total;
          this.good = res.data.records;
          console.log(this.good)
        }
      })
    },

  }
}
</script>

<style scoped>

.main-box{
  background-color: #e6a5a5;
  width: 1300px;
  border: #d89191 2px solid;
  border-radius: 40px;
  padding: 20px 40px;
  margin: 5px auto;
}

</style>