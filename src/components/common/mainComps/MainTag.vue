<template>
    <div class="tabs">
        <div>
        <el-tag 
            v-for="(tag,index) in tags"
            :key="tag.name"
            :closable="tag.name !== 'home'"
            :effect="$route.name === tag.name ? 'dark' : 'plain'"
            @click="changeMenu(tag)"
            @close="handleClose(tag,index)"
            size="small"
        >
        {{ tag.label }}
        </el-tag>
        </div>
        <div class="git">
            <a href="https://github.com/YLN-deng/park-manage.git"><img width="24" :src="githubImg" alt=""></a>
        </div>
    </div>
</template>

<script>
import { mapState,mapMutations } from 'vuex';

export default {
    name: 'CommonTag',
    data(){
        return {
            githubImg: require('../../../assets/image/github.svg')
        }
    },
    computed: {
        ...mapState({
            tags:state => state.tab.tabsList
        })
    },
    methods: {
        ...mapMutations({
            close: 'closeTag'
        }),
        changeMenu(item) {
            this.$router.push({name:item.name})
        },
        handleClose(tag,index) {
            const length = this.tags.length - 1
            this.close(tag)
            if(tag.name !== this.$route.name) {
                return
            }
            if(index === length) {
                this.$router.push({
                    name: this.tags[index -1].name
                })
            }else{
                this.$router.push({
                    name: this.tags[index].name
                })
            }
        }
    },
}
</script>

<style lang="less" scoped>
    .tabs {
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        .el-tag {
            margin-right: 15px;
            cursor: pointer;
        }
        .git {
           
            cursor: pointer;
        }
    }
</style>
