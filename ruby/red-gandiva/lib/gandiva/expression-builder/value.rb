# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Gandiva
  class ExpressionBuilder
    class Value
      def +(right)
        Add.new(self, resolve(right))
      end

      def -(right)
        Subtract.new(self, resolve(right))
      end

      def *(right)
        Multiply.new(self, resolve(right))
      end

      def /(right)
        Divide.new(self, resolve(right))
      end

      def >(right)
        GreaterThan.new(self, resolve(right))
      end

      def <(right)
        LessThan.new(self, resolve(right))
      end

      def ==(right)
        Equal.new(self, resolve(right))
      end

      private
      def resolve(value)
        Literal.resolve(value) or value
      end
    end
  end
end
