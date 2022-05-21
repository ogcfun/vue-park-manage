<template>
  <el-card style="height: 263px">
    <div style="height: 263px" ref="userEcharts"></div>
  </el-card>
</template>

<script>
import {getHomeData} from 'network/home';
import * as echarts from "echarts";

export default {
  name: "UserChart",
  mounted() {
    getHomeData().then((res) => {
      this.userchart = res.data.userchart;

      // console.log(this.userchart);

      // 用户图
      const userOption = {
        legend: {
          // 图例文字颜色
          textStyle: {
            color: "#333",
          },
        },
        grid: {
          left: "20%",
        },
        // 提示框
        tooltip: {
          trigger: "axis",
        },
        xAxis: {
          type: "category", // 类目轴
          data: this.userchart.map((item) => item.date),
          axisLine: {
            lineStyle: {
              color: "#17b3a3",
            },
          },
          axisLabel: {
            interval: 0,
            color: "#333",
          },
        },
        yAxis: [
          {
            type: "value",
            axisLine: {
              lineStyle: {
                color: "#17b3a3",
              },
            },
          },
        ],
        color: ["#2ec7c9", "#b6a2de"],
        series: [
          {
            name: "新增用户",
            data: this.userchart.map((item) => item.new),
            type: "bar",
          },
          {
            name: "活跃用户",
            data: this.userchart.map((item) => item.active),
            type: "bar",
          },
        ],
      };
      const U = echarts.init(this.$refs.userEcharts);
      U.setOption(userOption);
    });
  },
};
</script>

<style lang="less" scoped>
</style>