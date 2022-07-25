<template>
  <el-container style="height: 100vh">
    <el-aside width="auto">
      <main-aside />
    </el-aside>
    <el-container>
      <el-header>
        <main-header />
      </el-header>

      <main-tag />

      <el-main>
        <keep-alive exclude="Setting">
          <router-view />
        </keep-alive>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import MainAside from "components/common/mainComps/MainAside.vue";
import MainHeader from "components/common/mainComps/MainHeader.vue";
import MainTag from "components/common/mainComps/MainTag.vue";

export default {
  name: "Main",
  components: {
    MainAside,
    MainHeader,
    MainTag,
  },
};
</script>

<style scoped>
.el-header {
  background-color: rgb(35, 201, 223);
}

.el-main {
  padding-top: 0;
}
</style>