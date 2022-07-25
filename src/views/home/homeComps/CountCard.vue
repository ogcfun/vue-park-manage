<template>
  <div class="num">
    <el-card
      v-for="item in countData"
      :key="item.name"
      :body-style="{ display: 'flex', padding: 0 }"
      :style="{background:item.backgroundColor}"
    >
      <i
        class="icon"
        :class="`el-icon-${item.icon}`"
        :style="{ background: item.color }"
      ></i>
      <div class="detail">
        <p class="num">
          <animate-number
            from="0"
            :to="item.value"
            duration="2000"
          ></animate-number>
        </p>
        <p class="txt">{{ item.name }}</p>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "CountCard",
  props: {
    countData: {
      type: Array,
      default() {
        return [];
      },
    },
  },
};
</script>

<style lang="less" scoped>
</style>