module ControllersMachers

  # it { should respond_with_content('my content')  }
  # it { should respond_with_content(/status: [0-9]/)  }
  RSpec::Matchers.define :respond_with_content do |expected|
    match do |_|
      if expected.is_a?(Regexp)
        controller.response.body =~ expected
      else
        controller.response.body == expected
      end
    end

    description do
      "responses with content #{expected}"
    end

    failure_message_for_should do |_|
      "expected to respond with #{expected}\nbut got #{controller.response.body}"
    end

    failure_message_for_should_not do |_|
      "expected to not respond with #{expected}"
    end
  end

  # it { should respond_with_content_type(:json)  }
  # it { should_not respond_with_content_type(:json)  }
  RSpec::Matchers.define :respond_with_content_type do |type|
    match do |_|
      controller.response.content_type == Mime::Type.lookup_by_extension(type.to_sym)
    end

    description do
      "responses with content_type #{type}"
    end

    failure_message_for_should do |_|
      "expected to respond with content_type :#{type}\nbut got #{controller.response.content_type}"
    end

    failure_message_for_should_not do |_|
      "expected to not respond with content_type :#{type}"
    end
  end

  # it { should have_assigned(:user) }
  # it { should have_assigned(:user).with("user") }
  # it { should_not have_assigned(:user) }
  RSpec::Matchers.define :have_assigned do |name|
    match_for_should do |_|
      if defined?(@value)
        assigns(name) == @value
      else
        assigns(name).present?
      end
    end

    match_for_should_not do |_|
      assigns(name).nil?
    end

    chain :with do |value|
      @value = value
    end

    description do
      if @value
        "assign @#{name} with a value"
      else
        "assign @#{name}"
      end
    end

    failure_message_for_should do |_|
      received = assigns(name)
      received = received.to_a if received.is_a?(ActiveRecord::Relation)
      if @value
        "expected controller to have assigned @#{name} with #{@value.inspect}\nbut has #{received}"
      else
        "expected controller to have assigned @#{name}"
      end
    end

    failure_message_for_should_not do |_|
      "expected controller to not have assigned #{name}"
    end
  end

  # it { should have_set_flash(:alert) }
  # it { should have_set_flash(:alert).with("hello nurse") }
  # it { should_not have_set_flash(:alert) }
  RSpec::Matchers.define :have_set_flash do |name|
    match_for_should do |_|
      if @value
        flash[name] == @value
      else
        flash[name].present?
      end
    end

    match_for_should_not do |_|
      flash[name].nil?
    end

    chain :with do |value|
      @value = value
    end

    description do
      if @value
        "set flash :#{name} with a message"
      else
        "set flash :#{name}"
      end
    end

    failure_message_for_should do |_|
      received = flash[name]

      if @value
        "expected controller to have set flash :#{name} with #{@value.inspect} but had set #{received.inspect}"
      else
        "expected controller to have set flash :#{name}"
      end
    end

    failure_message_for_should_not do |_|
      "expected controller to not have set flash :#{name}"
    end
  end

  # it { should have_set_session(:account_id) }
  # it { should have_set_session(:account_id).with(123) }
  # it { should_not have_set_flash(:account_id) }
  RSpec::Matchers.define :have_set_session do |name|
    match_for_should do |_|
      if @value
        session[name] == @value
      else
        session[name].present?
      end
    end

    match_for_should_not do |_|
      session[name].nil?
    end

    chain :with do |value|
      @value = value
    end

    description do
      if @value
        "set session :#{name} with a value"
      else
        "set session :#{name}"
      end
    end

    failure_message_for_should do |_|
      received = session[name]

      if @value
        "expected controller to have set session :#{name} with #{@value.inspect} but had set #{received.inspect}"
      else
        "expected controller to have set session :#{name}"
      end
    end

    failure_message_for_should_not do |_|
      "expected controller to not have set session :#{name}"
    end
  end
end
