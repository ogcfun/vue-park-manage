<template>
  <el-row :gutter="20" style="margin: 20px 0 0 0">
    <el-col :span="6">
      <el-card>
        <div class="userBox">
          <img
            class="userImg"
            v-if="this.$store.state.user.userimage || userimage"
            :src="
              require(`@/api/${this.$store.state.user.userimage || userimage}`)
            "
            alt=""
          />
          <p class="userName">{{ userName }}</p>
          <p class="userPermissions">
            <el-tag>{{ permissions }}</el-tag>
          </p>
          <p class="el-icon-collection-tag userTag">计算机前端工程师</p>
          <br /><br />
          <p class="el-icon-office-building userTag">
            xxx公司 - xxx平台部 - xxx技术部 - UED
          </p>
          <br /><br />
          <p class="el-icon-guide userTag">台南市安平区建平十六街</p>
          <br /><br />
          <p class="el-icon-paperclip userTag">
            HTML、CSS、JavaScript、Vue、Php
          </p>
          <br /><br />
        </div>
        <div>
          <div class="user-info">
            <span class="tag">标签</span>
            <el-tag
              style="margin-bottom: 10px"
              :key="tag"
              v-for="tag in dynamicTags"
              closable
              :disable-transitions="false"
              @close="handleClose(tag)"
            >
              {{ tag }}
            </el-tag>
            <el-input
              class="input-new-tag"
              v-if="inputVisible"
              v-model="inputValue"
              ref="saveTagInput"
              size="small"
              @keyup.enter.native="handleInputConfirm"
              @blur="handleInputConfirm"
            >
            </el-input>
            <el-button
              v-else
              class="button-new-tag"
              size="small"
              @click="showInput"
              >+</el-button
            >
          </div>
        </div>
      </el-card>
    </el-col>
    <el-col :span="18">
      <el-card>
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="信息绑定" name="first"
            >信息绑定开发中......</el-tab-pane
          >
          <el-tab-pane label="文章管理" name="second"
            >文章管理开发中......</el-tab-pane
          >
          <el-tab-pane label="系统设置" name="third"
            >系统设置开发中......</el-tab-pane
          >
        </el-tabs>
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
import Cookie from "js-cookie";
export default {
  name: "Setting",
  data() {
    return {
      dynamicTags: ["很有想法的", "专注前端开发", "海纳百川"],
      inputVisible: false,
      inputValue: "",
      activeName: "first",
      userimage: Cookie.get("userimage"),
      userName: this.$store.state.user.userName || Cookie.get("usernamed"),
      permissions:
        this.$store.state.user.permissions || Cookie.get("permissions"),
    };
  },
  methods: {
    handleClick(tab, event) {
      // console.log(tab, event);
    },
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },

    showInput() {
      this.inputVisible = true;
      this.$nextTick((_) => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },

    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = "";
    },
  },
};
</script>

<style lang="less" scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
.userBox {
  width: 100%;
  border-bottom: 1px solid #000;
  .userImg {
    display: block;
    width: 200px;
    border-radius: 50%;
    margin: auto;
  }
  .userName {
    width: 120px;
    display: block;
    margin: 20px auto;
    font-size: 28px;
    font-weight: bolder;
    color: rgba(24, 23, 23, 0.623);
  }
  .userPermissions {
    width: 50px;
    display: block;
    margin: 20px auto;
  }
  .userTag {
    font-size: 16px;
    margin-top: 10px;
    margin-left: 50px;
  }
}
.user-info {
  width: 100%;
  margin-top: 30px;
  .tag {
    display: block;
    font-weight: bolder;
    margin-bottom: 20px;
  }
}
</style>