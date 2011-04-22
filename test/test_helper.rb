require File.expand_path('../../lib/embratel.rb', __FILE__)
require 'test/unit'

module ValidRows
  VALID_CALL_ROW = ['1',
                    '1634125644-FRANQUIA 01',
                    '04 - LIGACOES DDD PARA CELULARES',
                    '11/08/10 A  99/99/99',
                    '1993692887',
                    'SCL -SP',
                    'CAS -SP',
                    '02:56:29 AM',
                    '',
                    'E',
                    '',
                    '500',
                    'MIN',
                    '0.73']

  VALID_FEE_ROW = ['1',
                   '1634125644-FRANQUIA 01',
                   '04 - LIGACOES DDD PARA CELULARES',
                   '11/08/10 A  99/99/99',
                   '',
                   'SCL -SP',
                   'CAS -SP',
                   '02:56:29 AM',
                   '',
                   'E',
                   '',
                   '500',
                   'MIN',
                   '0.73']
end
