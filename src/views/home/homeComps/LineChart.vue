<template>
  <el-card style="height: 280px">
    <div style="height: 280px" ref="echarts"></div>
  </el-card>
</template>

<script>
import {getHomeData} from 'network/home';
import * as echarts from "echarts";
export default {
  name: "LineChart",
  data() {
    return {
      linechart: [],
    };
  },
  mounted() {
    getHomeData().then((res) => {
      this.linechart = res.data.linechart;
      let linechartName = [];
      let linechartDate = [];
      const data = [];
      let series = [];
      for (let i = 0; i < this.linechart.length; i++) {
        const name = this.linechart[i].name;
        const date = this.linechart[i].date;
        const january = this.linechart[i].january;
        const february = this.linechart[i].february;
        const march = this.linechart[i].march;
        const april = this.linechart[i].april;
        const may = this.linechart[i].may;
        const june = this.linechart[i].june;
        const july = this.linechart[i].july;

        linechartName.push(name);
        linechartDate.push(date);
        data.push([january, february, march, april, may, june, july]);
      }

      for (let i = 0; i < linechartName.length; i++) {
        series.push({
          name: linechartName[i],
          data: data[i],
          type: "line",
        });
      }

      // 折线图
      const option = {
        title: {
          text: "", //标题
        },
        tooltip: {
          trigger: "axis",
        },
        xAxis: {
          data: linechartDate,
          type: "category", // 类目轴
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
        yAxis: {},
        legend: {
          data: linechartName,
        },
        series,
      };
      const E = echarts.init(this.$refs.echarts);
      E.setOption(option);
    });
  },
};
</script>

<style lang="">
</style>