<template>
  <v-container class="grey lighten-4">
    <v-layout class="py-3" column>
      <v-flex>
        <div class="headline mb-3">Current unbinded images</div>
        <v-layout column align-start>
          <v-flex v-for="image in unbindedImages" :key="image.id">
            <div class="title">{{ image.img_url }}</div>
            <v-img :src="getFullImageUrl(image.img_url)" height="150px" contain/>
          </v-flex>
        </v-layout>
      </v-flex>
      <v-flex xs12 class="mt-5">
        <div class="title">Upload unbinded images</div>
        <input type="file" ref="imageFiles" multiple @input="handleImageUploads">
      </v-flex>
      <v-btn color="success" @click="handleUploadClick()">Upload unbinded images</v-btn>
      <v-btn @click="handleCancelClick()">Cancel</v-btn>
    </v-layout>
  </v-container>
</template>

<script>
import AdminVerifierMixin from "@/mixins/AdminVerifierMixin"

export default {
  mixins: [AdminVerifierMixin],
  created() {
    this.apiGetUnbindedImages();
  },
  data() {
    return {
      uploadedImageFiles: [],
      unbindedImages: []
    };
  },
  methods: {
    apiGetUnbindedImages() {
      this.$http
        .get(`/admin/images/`, {
          params: {
            location_id: 0
          }
        })
        .then(response => {
          console.log(
            "successful retrieved images data from API: ",
            response.data
          );
          this.unbindedImages = response.data;
        })
        .catch(error => {
          console.log(
            "error retrieving location update/delete data from API: ",
            error
          );
        });
    },
    getFullImageUrl(imgUrl) {
      return `${this.$backendStaticPath}images/locations/${imgUrl}`;
    },
    handleImageUploads() {
      const imageFiles = this.$refs.imageFiles.files;
      this.uploadedImageFiles = [];
      for (let i = 0; i < imageFiles.length; i++) {
        this.uploadedImageFiles.push(imageFiles[i]);
      }
    },
    handleUploadClick() {
      let formData = new FormData();
      for (let imageFile of this.uploadedImageFiles) {
        formData.append("images", imageFile);
      }
      console.log(formData);
      this.$http
        .post(`/admin/images/`, formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(response => {
          console.log("successfully patched updated location to API", response);
          this.$router.go();
        })
        .catch(function(error) {
          console.log("error patching updated location to API", error);
        });
    },
    handleCancelClick() {
      console.log("cancel");
      this.$router.go(-1);
    }
  }
};
</script>

<style>
</style>
