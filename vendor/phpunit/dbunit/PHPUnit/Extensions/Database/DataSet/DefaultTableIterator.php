<?php
/**
 * PHPUnit
 *
 * Copyright (c) 2002-2013, Sebastian Bergmann <sebastian@phpunit.de>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Sebastian Bergmann nor the names of his
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @package    DbUnit
 * @author     Mike Lively <m@digitalsandwich.com>
 * @copyright  2002-2013 Sebastian Bergmann <sebastian@phpunit.de>
 * @license    http://www.opensource.org/licenses/BSD-3-Clause  The BSD 3-Clause License
 * @link       http://www.phpunit.de/
 * @since      File available since Release 1.0.0
 */

/**
 * The default table iterator
 *
 * @package    DbUnit
 * @author     Mike Lively <m@digitalsandwich.com>
 * @copyright  2010-2013 Mike Lively <m@digitalsandwich.com>
 * @license    http://www.opensource.org/licenses/BSD-3-Clause  The BSD 3-Clause License
 * @version    Release: @package_version@
 * @link       http://www.phpunit.de/
 * @since      Class available since Release 1.0.0
 */
class PHPUnit_Extensions_Database_DataSet_DefaultTableIterator implements PHPUnit_Extensions_Database_DataSet_ITableIterator
{
    /**
     * An array of tables in the iterator.
     *
     * @var Array
     */
    protected $tables;

    /**
     * If this property is true then the tables will be iterated in reverse
     * order.
     *
     * @var bool
     */
    protected $reverse;

    /**
     * Creates a new default table iterator object.
     *
     * @param array $tables
     * @param bool $reverse
     */
    public function __construct(Array $tables, $reverse = FALSE)
    {
        $this->tables  = $tables;
        $this->reverse = $reverse;

        $this->rewind();
    }

    /**
     * Returns the current table.
     *
     * @return PHPUnit_Extensions_Database_DataSet_ITable
     */
    public function getTable()
    {
        $this->current();
    }

    /**
     * Returns the current table's meta data.
     *
     * @return PHPUnit_Extensions_Database_DataSet_ITableMetaData
     */
    public function getTableMetaData()
    {
        $this->current()->getTableMetaData();
    }

    /**
     * Returns the current table.
     *
     * @return PHPUnit_Extensions_Database_DataSet_ITable
     */
    public function current()
    {
        return current($this->tables);
    }

    /**
     * Returns the name of the current table.
     *
     * @return string
     */
    public function key()
    {
        return $this->current()->getTableMetaData()->getTableName();
    }

    /**
     * advances to the next element.
     *
     */
    public function next()
    {
        if ($this->reverse) {
            prev($this->tables);
        } else {
            next($this->tables);
        }
    }

    /**
     * Rewinds to the first element
     */
    public function rewind()
    {
        if ($this->reverse) {
            end($this->tables);
        } else {
            reset($this->tables);
        }
    }

    /**
     * Returns true if the current index is valid
     *
     * @return bool
     */
    public function valid()
    {
        return ($this->current() !== FALSE);
    }
}
