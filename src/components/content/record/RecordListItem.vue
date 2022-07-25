<template>
  <div class="record-list-item">
    <div>
      <el-image
        class="user_img"
        :src="baseUrl() + recordList.user_img"
      ></el-image>
    </div>
    <div class="user_name">{{ recordList.user_name }}</div>
    <div class="user_level">
      <el-tag size="small" type="danger">{{ recordList.user_level }}</el-tag>
    </div>
    <div class="send_time">{{ recordList.send_time }}</div>
    <div class="user_message">{{ recordList.user_message }}</div>
  </div>
</template>

<script>
import { baseUrl } from "network/request";

export default {
  name: "RecordListItem",
  props: {
    recordList: {
      type: Object,
      default() {
        return {};
      },
    },
  },
  methods: {
    baseUrl() {
      return baseUrl();
    },
  },
};
</script>

<style scoped>
.record-list-item {
  display: flex;
}
.user_img {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}

.user_name {
  font-size: 14px;
  font-weight: bold;
  margin: -2px 0 0 10px;
}

.user_level {
    position: absolute;
    top: 15px;
    right: 10px;
}

.send_time {
    position: absolute;
    right: 10px;
    bottom: 15px;
}

.user_message {
    margin-top: 20px;
    margin-left: -55px;
    width: 600px;
    word-wrap:break-word;
    overflow: hidden;
    letter-spacing: 2px;
    line-height: 1.2;
}
</style>