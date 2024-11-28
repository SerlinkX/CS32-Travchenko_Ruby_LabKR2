# Черга для передачі даних між потоками
queue = Queue.new

# Потік для генерації чисел
generator_thread = Thread.new do
  loop do
    number = rand(1..100)  # Генеруємо випадкове число
    queue << number        # Додаємо число в чергу
    sleep 0.5              # Затримка для імітації процесу генерації
  end
end

# Потік для виведення лише непарних чисел
odd_numbers_thread = Thread.new do
  loop do
    number = queue.pop  # Отримуємо число з черги
    puts "Непарне число: #{number}" if number.odd?  # Виводимо лише непарні
  end
end

# Забезпечення роботи потоків
generator_thread.join
odd_numbers_thread.join
