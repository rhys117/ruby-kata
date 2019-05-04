OBSERVED_UNIUQUE_MARKERS = []

def next_unique_marker
  if OBSERVED_UNIUQUE_MARKERS.last.nil?
    OBSERVED_UNIUQUE_MARKERS << 'a'
    'a'
  else
    next_marker = OBSERVED_UNIUQUE_MARKERS.last.next
    OBSERVED_UNIUQUE_MARKERS << next_marker
    next_marker
  end
end

def leet_classes
  classes = []

  (1..1337).each do |number|
    klass_name = "Klass_#{number}"
    klass = Class.new do
      define_method next_unique_marker.to_sym do
        next_unique_marker
      end

      define_singleton_method  next_unique_marker.to_sym do
        next_unique_marker
      end
    end
    classes << Object.const_set(klass_name, klass)
  end
  classes
end