import React, { useState, useRef, useEffect } from 'react';
import { Search, Plus, Check } from 'lucide-react';

interface Option {
  value: string | number;
  label: string;
}

interface SearchableSelectWithCreateProps {
  options: Option[];
  value: string | number | null;
  onChange: (value: string | number | null) => void;
  onCreateNew?: (searchValue: string) => void;
  placeholder?: string;
  createLabel?: string;
  disabled?: boolean;
}

export const SearchableSelectWithCreate: React.FC<SearchableSelectWithCreateProps> = ({
  options,
  value,
  onChange,
  onCreateNew,
  placeholder = "Select an option...",
  createLabel = "Create New",
  disabled = false
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const wrapperRef = useRef<HTMLDivElement>(null);

  const selectedOption = options.find(opt => opt.value === value);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [wrapperRef]);

  const filteredOptions = options.filter(opt => 
    opt.label.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const handleSelect = (val: string | number) => {
    if (disabled) return;
    onChange(val);
    setIsOpen(false);
    setSearchTerm('');
  };

  const handleCreateNew = () => {
    if (disabled || !onCreateNew) return;
    onCreateNew(searchTerm);
    setIsOpen(false);
    setSearchTerm('');
  };

  return (
    <div className="relative w-full" ref={wrapperRef}>
      <div 
        className={`flex items-center justify-between w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus-within:ring-1 focus-within:ring-medical-mutedblue focus-within:border-medical-mutedblue ${disabled ? 'opacity-60 cursor-not-allowed bg-gray-50' : 'cursor-text'}`}
        onClick={() => !disabled && setIsOpen(true)}
      >
        {!isOpen && selectedOption ? (
          <span className="block truncate text-sm text-gray-900">{selectedOption.label}</span>
        ) : (
          <div className="flex items-center w-full gap-2">
            <Search size={14} className="text-gray-400" />
            <input
              type="text"
              className="w-full bg-transparent outline-none text-sm text-gray-900 placeholder-gray-400 disabled:cursor-not-allowed"
              placeholder={selectedOption ? selectedOption.label : placeholder}
              value={searchTerm}
              disabled={disabled}
              onChange={(e) => {
                if (disabled) return;
                setSearchTerm(e.target.value);
                setIsOpen(true);
              }}
              onFocus={() => !disabled && setIsOpen(true)}
            />
          </div>
        )}
      </div>

      {isOpen && !disabled && (
        <div className="absolute z-50 w-full mt-1 bg-white border border-gray-200 rounded-md shadow-lg max-h-60 overflow-auto">
          <ul className="py-1 text-sm text-gray-700">
            {filteredOptions.length > 0 ? (
              filteredOptions.map((option) => (
                <li 
                  key={option.value}
                  className="px-3 py-2 cursor-pointer hover:bg-blue-50 flex items-center justify-between"
                  onClick={() => handleSelect(option.value)}
                >
                  <span>{option.label}</span>
                  {value === option.value && <Check size={14} className="text-medical-mutedblue" />}
                </li>
              ))
            ) : (
              <li className="px-3 py-2 text-gray-500 italic">No matches found</li>
            )}
            
            {/* Show create new option if onCreateNew is defined and there's a search term or list is empty */}
            {onCreateNew && (
              <li 
                className="px-3 py-2 mt-1 cursor-pointer bg-green-50 text-green-700 hover:bg-green-100 flex items-center gap-2 border-t border-green-100 font-medium transition-colors"
                onClick={(e) => {
                  e.stopPropagation();
                  handleCreateNew();
                }}
              >
                <Plus size={16} /> 
                {searchTerm ? `Add "${searchTerm}" as ${createLabel}` : `Add New ${createLabel}`}
              </li>
            )}
          </ul>
        </div>
      )}
    </div>
  );
};
