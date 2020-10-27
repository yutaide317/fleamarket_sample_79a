# describe ItemImage do
#   describe '#create' do
#     # 2. imagesが空では登録できないこと
#     it "is invalid without images" do
#       image = build(:image, src: nil)
#       image.valid?
#       expect(image.errors[:src]).to include("をアップロードしてください")
#     end
#   end
# end