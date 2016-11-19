def CameraUpload(url:, quality: 0.6, callback: :render)

  # request_type = :request # doesn't supports multipart yet
  request_type = :upload    # requires a modified version of jasonette - TODO: link

  success = {
    type: "$render"
  }

  if callback == :retake
    success = {
      type: "$reload"
    }
  end

  data = "{{$jason.data}}"


  {
    type: "$media.camera",
    options: {
      quality: quality.to_s
    },
    success: {
      type: "$network.#{request_type}",
      options: {
        url: url,
        method: "post",
        content_type: "image/jpeg",
        data: data
      },
      success: success
    }
  }
end

# extra:
#
# filename: "{{$jason.filename}}",
