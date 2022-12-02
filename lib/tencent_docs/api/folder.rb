module TencentDocs
  module Api
    module Folder
      # https://docs.qq.com/open/document/app/openapi/v2/file/folders/list.html
      def list(folder_id: nil, sort_type: nil, asc: nil, start: nil, limit: nil)
        get "/openapi/drive/v2/folders/#{folder_id}", params: {
          sortType: sort_type,
          asc: asc,
          start: start,
          limti: limit
        }
      end
    end
  end
end
