require 'rails_helper'

describe ActiveAdmin::Views::StatusTag do

  describe "#status_tag" do

    # Helper method to build StatusTag objects in an Arbre context
    def status_tag(*args)
      render_arbre_component(status_tag_args: args) do
        status_tag(*assigns[:status_tag_args])
      end
    end

    subject { status_tag(nil) }


    describe '#tag_name' do
      subject { super().tag_name }
      it    { is_expected.to eq 'span' }
    end

    describe '#class_list' do
      subject { super().class_list }
      it  { is_expected.to include('status_tag') }
    end

    context "when status is 'completed'" do
      subject { status_tag('completed') }

      describe '#tag_name' do
        subject { super().tag_name }
        it    { is_expected.to eq 'span' }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('completed') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq 'Completed' }
      end
    end

    context "when status is 'in_progress'" do
      subject { status_tag('in_progress') }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('in_progress') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq 'In Progress' }
      end
    end

    context "when status is 'In progress'" do
      subject { status_tag('In progress') }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('in_progress') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq 'In Progress' }
      end
    end

    context "when status is an empty string" do
      subject { status_tag('') }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq '' }
      end
    end

    context "when status is false" do
      subject { status_tag('false') }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq('No') }
      end
    end

    context "when status is nil" do
      subject { status_tag(nil) }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq('No') }
      end
    end

    context "when status is 'Active' and type is :ok" do
      subject { status_tag('Active', :ok) }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('active') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('ok') }
      end
    end

    context "when status is 'Active' and class is 'ok'" do
      subject { status_tag('Active', class: 'ok') }

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('active') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('ok') }
      end
    end

    context "when status is 'Active' and label is 'on'" do
      subject { status_tag('Active', label: 'on') }

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq 'on' }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('active') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.not_to include('on') }
      end
    end

    context "when status is 'So useless', type is :ok, class is 'woot awesome' and id is 'useless'" do
      subject { status_tag('So useless', :ok, class: 'woot awesome', id: 'useless') }

      describe '#content' do
        subject { super().content }
        it     { is_expected.to eq 'So Useless' }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('status_tag') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('ok') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('so_useless') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('woot') }
      end

      describe '#class_list' do
        subject { super().class_list }
        it  { is_expected.to include('awesome') }
      end

      describe '#id' do
        subject { super().id }
        it          { is_expected.to eq 'useless' }
      end
    end

  end # describe "#status_tag"
end
