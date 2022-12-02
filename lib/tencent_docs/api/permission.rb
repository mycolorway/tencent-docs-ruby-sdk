module TencentDocs
  module Api
    module Permission
      # https://docs.qq.com/open/document/app/openapi/v2/file/files/access.html
      def access(file_id:)
        get "/openapi/drive/v2/files/#{file_id}/access"
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/ownership.html
      def trans(file_id:, owner_id:)
        patch "/openapi/drive/v2/files/#{file_id}/ownership", {
          ownerID: owner_id
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/permission/get.html
      def get_permission(file_id:)
        get "/openapi/drive/v2/files/#{file_id}/permission"
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/permission/set.html
      # policy:
      #   private 仅文档拥有者可查看和编辑
      #   members 指定用户可查看 / 编辑
      #   publicRead  任何人可查看
      #   publicWrite 任何人可编辑
      def set_permission(file_id:, policy: 1, copy_enabled: nil, reader_comment_enabled: nil)
        patch "/openapi/drive/v2/files/#{file_id}/permission", {
          policy: policy,
          copy_enabled: copy_enabled,
          reader_comment_enabled: reader_comment_enabled
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/collaborators/add.html
      # collaborators: [{ type: 'user', role: 'reader|writer', id: 'open_id'}]
      def add_collaborators(file_id:, collaborators: [])
        patch "/openapi/drive/v2/files/#{file_id}/collaborators", {
          collaborators: collaborators
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/collaborators/delete.html
      def delete_collaborators(file_id:, open_id:)
        delete "/openapi/drive/v2/files/#{file_id}/collaborators", params: {
          type: 'user',
          id: open_id
        }
      end

      # https://docs.qq.com/open/document/app/openapi/v2/file/files/collaborators/get.html
      def list_collaborators(file_id:)
        get "/openapi/drive/v2/files/#{file_id}/collaborators"
      end
    end
  end
end
