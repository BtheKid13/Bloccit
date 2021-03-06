# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
include RandomData


RSpec.describe Label, type: :model do

    let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
    let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld", role: 1) }
    let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
    let(:label) { Label.create!(name: 'Label') }

    it { is_expected.to have_many :labelings }
    it { is_expected.to have_many(:topics).through(:labelings) }
    it { is_expected.to have_many(:posts).through(:labelings) }

    describe "labelings" do
      it "allows the same label to be associated with a different topic and post" do
        topic.labels << label
        post.labels << label

        topic_label = topic.labels[0]
        post_label = post.labels[0]
  # #11
        expect(topic_label).to eql(post_label)
      end
    end

  describe ".update_labels" do
    it "takes a comma delimeited string and returns an array of Labels" do
      labels = "#{label.name}"
      labels_as_a = [label]

      expect(Label.update_labels(labels)).to eq(labels_as_a)
    end
  end
end
