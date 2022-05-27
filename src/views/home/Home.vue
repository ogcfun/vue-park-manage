<template>
  <el-row class="home" :gutter="20">
    <el-col :span="8" style="margin-top: 20px">
      <user-card></user-card>
      <data-card :tableData="tableData" :tableLabel="tableLabel"></data-card>
    </el-col>

    <el-col style="margin-top: 20px" :span="16">
      <count-card :countData="countData"></count-card>
      <line-chart></line-chart>

      <div class="graph">
        <user-chart></user-chart>
        <video-data></video-data>
      </div>
    </el-col>
  </el-row>
</template>

<script>
import { getHomeData } from "network/home";
import UserCard from "./homeComps/UserCard.vue";
import DataCard from "./homeComps/DataCard.vue";
import CountCard from "./homeComps/CountCard.vue";
import LineChart from "./homeComps/LineChart.vue";
import UserChart from "./homeComps/UserChart.vue";
import VideoData from "./homeComps/VideoData.vue";

export default {
  name: "Home",
  components: {
    UserCard,
    DataCard,
    CountCard,
    LineChart,
    UserChart,
    VideoData,
  },
  data() {
    return {
      tableData: [],
      countData: [],
      tableLabel: {
        name: "门票类型",
        todayBuy: "今日购买",
        monthBuy: "本月购买",
        totalBuy: "总购买",
      },
    };
  },
  created() {
    // 此处用created相当于对前端页面数据进行初始化
    // axios.get("http://localhost/park-manage/src/php/home.php").then((res) => {
    //   console.log(res);
    //  this.tableData = res.data.data.tabledata;//获取数据
    //  this.countData = res.data.data.countdata;
    // });
    getHomeData().then((res) => {
      this.tableData = res.data.tabledata; //获取数据
      this.countData = res.data.countdata;
      // console.log(res);
    });
  },
};
</script>

<style lang="less" scoped>
</style>