<template>
  <div>
    <p>{{ message }} - {{ count }}</p>
    <button @click="count++">Click meh</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      count: 0
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
