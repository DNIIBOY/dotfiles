local keymap = vim.keymap

keymap.set('n', '<leader>aa', '<cmd>ArduinoAttach<cr>')
keymap.set('n', '<leader>av', '<cmd>ArduinoVerify<cr>')
keymap.set('n', '<leader>au', '<cmd>ArduinoUpload<cr>')
keymap.set('n', '<leader>aus', '<cmd>ArduinoUploadAndSerial<cr>')
keymap.set('n', '<leader>as', '<cmd>ArduinoSerial<cr>')
keymap.set('n', '<leader>ab', '<cmd>ArduinoChooseBoard<cr>')
keymap.set('n', '<leader>ap', '<cmd>ArduinoChooseProgrammer<cr>')

