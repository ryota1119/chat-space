require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合' do
      it 'contentがあれば保存できること' do
        expect(build(:message, image: "")).to be_valid
      end
      it 'imageがあれば保存できること' do
        expect(build(:message, content: "")).to be_valid
      end
      it 'contentとimageがあれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end
    context 'messageを保存できない場合' do
      it 'contentとimageが両方体と保存できないこと' do
        message = build(:message, content: "", image: "")
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end
      it 'group_idが空だと保存できないこと' do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end
      it 'user_idが空だと保存できないこと' do
        message = build(:message, user_id: "")
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end