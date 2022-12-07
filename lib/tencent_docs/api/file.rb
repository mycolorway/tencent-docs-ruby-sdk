module TencentDocsSdk
  module Api
    module File
      # https://docs.qq.com/open/document/app/openapi/v2/file/files/create.html
      # type: doc、sheet
      def create(title:, type:)
        post '/openapi/drive/v2/files', {
          title: title,
          type: type
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/metadata.html
      def query(file_id:)
        get "/openapi/drive/v2/files/#{file_id}/metadata"
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/util/temp_url.html
      def temp_url(file_id:)
        post "/openapi/drive/v2/util/temp-url", {
          fileID: file_id,
          type: 'open'
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/update.html
      def rename(file_id:, title:)
        patch "/openapi/drive/v2/files/#{file_id}", {
          title: title
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/copy.html
      def copy(file_id:, title:, folder_id: nil)
        post "/openapi/drive/v2/files/#{file_id}/copy", {
          title: title,
          folder_id: folder_id
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/delete.html
      # 是否删除到回收站（0：彻底删除，1：删除到回收站）
      def destroy(file_id:, recoverable: 1)
        delete "/openapi/drive/v2/files/#{file_id}", params: {
          recoverable: recoverable
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/recover.html
      def recover(file_id:)
        patch "/openapi/drive/v2/files/#{file_id}/recover"
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/export/async_export.html
      def async_export(file_id:)
        post "/openapi/drive/v2/files/#{file_id}/async-export"
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/export/export_progress.html
      def export_progress(file_id:, operation_id:)
        get "/openapi/drive/v2/files/#{file_id}/export-progress", params: {
          operationID: operation_id
        }
      end
    end
  end
end
