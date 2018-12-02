# how to use
# s3 = S3Importer.new
# imported = s3.import
# s3.delete_object

class S3Importer

  def import
    bucket.objects.map do |obj|
      parse_body(obj)
    end
  end

  def delete_objects
    bucket.objects.map do |obj|
      obj.delete
    end
  end

  private

  def parse_body object
    JSON.parse(object.get.body.gets)
  end

  def s3
    @s3 ||= Aws::S3::Resource.new(region:'us-east-1')
  end

  def bucket
    bucket_name = ENV['S3_BUCKET'] || "zubora"
    raise BucketNotConfiguredError.new("A bucket has not been configured") unless bucket_name.present?
    @bucket ||= s3.bucket(bucket_name)
  end
end